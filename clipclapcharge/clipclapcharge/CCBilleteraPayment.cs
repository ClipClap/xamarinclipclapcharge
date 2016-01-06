using System;
using Newtonsoft.Json.Linq;

namespace clipclapcharge
{
	public class CCBilleteraPayment
	{
		public JArray itemsArray;
		public JObject itemClipClap;
		private  string SECRETKEY="secretKey";
		private  string ITEMCOUNT="itemCount";
		private  string ITEMNAME="itemName";
		private  string ITEMVALUE="itemValue";
		private  string TAXID="taxId";
		private  string DETAILS="details";
		public static  int CONSUMO_REGULAR_8=5;
		public static  int IVA_EXCLUIDO_0=4;
		public static  int IVA_EXCENTO_0=3;
		public static  int IVA_REDUCIDO_5=2;
		public static  int IVA_REGULAR_16_=1;
		public static  int IVA_AMPLIADO_20=7;
		public static  int CONSUMO_REDUCIDO_4=6;
		private  string TIPVALUE="tipValue";
		private  string TAXVALUE="taxValue";
		private  string NETVALUE="netValue";
		private  string DESCRIPTION="description";
		public static  string BILLETERA_PLAYSTORE="https://play.google.com/store/apps/details?id=clipclap.app.clip&hl=es";
		public static  string BILLETERA_APPSTORE="'https://itunes.apple.com/app/id1000072986";

		public CCBilleteraPayment (string secretKey)
		{
			itemsArray = new JArray();
			itemClipClap= new JObject();
			itemClipClap [SECRETKEY] = secretKey;
			itemClipClap [DETAILS] = itemsArray;
		}

		public void addItem(String name, int count, int value, int taxId ) {
			JObject jsonItem = new JObject();
			jsonItem[ITEMCOUNT]= count;
			jsonItem[ITEMNAME] = name;
			jsonItem [ITEMVALUE] = value;
			jsonItem [TAXID] = taxId;
			itemsArray.Add(jsonItem);
		}

		public void addItem(String name, int count, int value){
			JObject jsonItem = new JObject();
			jsonItem[ITEMCOUNT]= count;
			jsonItem[ITEMNAME] = name;
			jsonItem [ITEMVALUE] = value;
			itemsArray.Add(jsonItem);
		}


		public void addTotal(String description,int netvalue, int taxValue, int tipValue) {
			itemClipClap[DESCRIPTION]=description;
			itemClipClap[NETVALUE]= netvalue;
			itemClipClap[TAXVALUE]= taxValue;
			itemClipClap[TIPVALUE]=tipValue;
		}


		public string getJSON(){
			return itemClipClap.ToString();;
		}
	}
}
