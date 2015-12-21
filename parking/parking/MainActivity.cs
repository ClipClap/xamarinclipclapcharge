using Android.App;
using Android.Widget;
using Android.OS;
using clipclapcharge;
using Java.Lang;
using Newtonsoft.Json;
using System.Linq;
using Android.Content;
using Android.Util;

namespace parking
{
	[Activity (Label = "MainActivity", MainLauncher = true, Icon = "@mipmap/icon")]
	[IntentFilter(new [] {Android.Content.Intent.ActionView },
		DataScheme="parking",
		DataHost="parking",
		Categories=new [] { Android.Content.Intent.CategoryDefault,Android.Content.Intent.CategoryBrowsable })]
	public class MainActivity : Activity, SaveTokenListener
	{

		CCService ccService;
		Button button;
		protected override void OnCreate (Bundle savedInstanceState)
		{
			
			base.OnCreate (savedInstanceState);

			// Set our view from the "main" layout resource
			SetContentView (Resource.Layout.Main);

			//Deep Link
			if (Intent.HasExtra ("al_applink_data")) {

				var appLinkData = Intent.GetStringExtra ("al_applink_data");

				var alUrl= Intent.Data.ToString();
				Log.Info ("Response", alUrl);
					
			}

			//Initialize with your secretKey
			CCBilleteraPayment cc = new CCBilleteraPayment ("pKFe1P2iYw6z73srBDBx");

			 
			//Add an Item with tax
			cc.addItem ("item1", 100, 200, CCBilleteraPayment.IVA_REGULAR_16_);
			//Add an Item without tax
			cc.addItem ("item1", 100, 200);

			//Add Total, description, netTotal, tax, tip
			cc.addTotal ("total", 100, 200,20);


			 button = FindViewById<Button> (Resource.Id.myButton);

			button.Click += delegate {

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


