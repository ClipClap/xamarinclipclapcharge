using Android.App;
using Android.Widget;
using Android.OS;
using clipclapcharge;
using Java.Lang;
using System.Linq;
using Android.Content;
using Android.Util;
using System.Collections.Generic;
using Android.Views;


namespace parking
{
	[Activity (Label = "MainActivity", MainLauncher = true, Icon = "@mipmap/icon" , WindowSoftInputMode =  SoftInput.AdjustPan)]
	[IntentFilter(new [] {Android.Content.Intent.ActionView },
		DataScheme="parking",
		DataHost="parking",
		Categories=new [] { Android.Content.Intent.CategoryDefault,Android.Content.Intent.CategoryBrowsable })]
	public class MainActivity : Activity, SaveTokenListener
	{

		CCService ccService;
		Button button;
		List<Item> items = new List<Item> ();
		public MainActivity self;
		CCBilleteraPayment cc;
		protected override void OnCreate (Bundle savedInstanceState)
		{
			
			base.OnCreate (savedInstanceState);

			// Set our view from the "main" layout resource
			SetContentView (Resource.Layout.Main);
			self = this;
			EditText secretkey = FindViewById<EditText>(Resource.Id.secretkey);
		
			ListView listView = FindViewById<ListView> (Resource.Id.listView);
			ItemAdapter itemAdapter = new ItemAdapter (this, items);
			listView.Adapter = itemAdapter;
			itemAdapter.NotifyDataSetChanged();
			Button addButton = FindViewById<Button> (Resource.Id.add_button);
			//addButton.Text=itemAdapter.Count+"";
			addButton.Click += delegate {
				
				items.Add (new Item ());
				itemAdapter.NotifyDataSetChanged();
				addButton.Text=itemAdapter.Count+"";

			};
			//Deep Link
			if (Intent.HasExtra ("al_applink_data")) {

				var appLinkData = Intent.GetStringExtra ("al_applink_data");

				var alUrl= Intent.Data.ToString();
				Log.Info ("Response", alUrl);
					
			}

			//Initialize with your secretKey
	

			 
		


			 button = FindViewById<Button> (Resource.Id.myButton);

			button.Click += delegate {


				cc = new CCBilleteraPayment (secretkey.Text);

				//Add Total, description, netTotal, tax, tip
				cc.addTotal ("total", 100, 200,20);

				// PayAndGo.type = PayAndGo.DEVELOPMENT;
				foreach (var item in items){
					//Get info from UI
					int value = item.value;
					string name = item.name;
					int count = item.count;


					//Add data into the model (you can add many items) CCBilleteraPayment Contains the available taxes
					cc.addItem(name, count, value, CCBilleteraPayment.IVA_REGULAR_16_);

				}

				//Add Total, custom tax and tip
				EditText total= FindViewById<EditText>(Resource.Id.totalValue);
				if(total.Text!=null && total.Text != ""){
					int totalV=Integer.ParseInt(total.Text);
					int tax=0;
					int tip=0;
					string description="";
					total= FindViewById<EditText>(Resource.Id.taxValue);
					if(total.Text!=null && total.Text != ""){tax=Integer.ParseInt(total.Text);}
					total= FindViewById<EditText>(Resource.Id.tipValue);
					if(total.Text!=null && total.Text != ""){tip=Integer.ParseInt(total.Text);}
					total= FindViewById<EditText>(Resource.Id.description);
					if(total.Text!=null && total.Text != ""){description=total.Text;}
					cc.addTotal(description,totalV,tax,tip);
				}



				ccService= new CCService();
				ccService.setJson(cc.getJSON());
				ccService.setCallBack("parking://parking");

				try{
					
				ccService.setSaveTokenListener(this);
				ccService.getToken();
				}catch(Exception e){
					e.PrintStackTrace();
				}
			};
		}

		public void saveToken(string content){
			
			var uri = Android.Net.Uri.Parse (ccService.getUrlDeep());
		
			var intent = new Intent (Intent.ActionView, uri);
			StartActivity (intent);	
		}
	}
}


