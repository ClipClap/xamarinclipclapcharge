using System;
using System.IO;
using System.Diagnostics;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Linq;
using RestSharp;
using System.Text;

namespace clipclapcharge
{
	public class CCService
	{
		
		private string urlProduction="https://clipclap.co/Production/gatewayClipClap/sdk/";

		private string urlDeepAndroidProduction= "ClipClapBilletera://?type=ClipClapWeb&token=";
		private string callback;
		private int type ;
		private SaveTokenListener mSaveTokenListener;
		public static int DEVELOPMENT=1;
		public static int PRODUCTION= 2;
		private string json;
		private string token="aaaa";
		public CCService (int type)
		{
			setTypes (PRODUCTION);
		}

		public CCService ()
		{
			setTypes (PRODUCTION);
		}

		public int getTypes(){
			return type;
		}

		public void setTypes(int type){
			this.type = type;
		}
		public void setCallBack(String url){
			this.callback = url;
		}

		public void setJson(string json){
			this.json=json;
		}
	
		public void setSaveTokenListener(SaveTokenListener saveTokenListener){
			this.mSaveTokenListener=saveTokenListener;
		}

		public void getToken(){

			string url;
				url = urlProduction;
			
			var client = new RestClient(url);


			var request = new RestRequest("clipclap.php", Method.POST);
		


			request.AddParameter("input",json);

	
			client.ExecuteAsync(request, response => {
				Response respon  = SimpleJson.DeserializeObject<Response>(response.Content);

				token=respon.token;

				if(token != null){
				mSaveTokenListener.saveToken(token);
				}else{
					string inputString = response.Content;

					StringBuilder sb = new StringBuilder();
					string[] parts = inputString.Split(new char[] { ' ', '\n', '\t', '\r', '\f', '\v','\\', '\"' }, StringSplitOptions.RemoveEmptyEntries);
					int size = parts.Length;
					for (int i = 0; i < size; i++)
						sb.AppendFormat("{0}", parts[i]);
					inputString = sb.ToString();
					//respon  = SimpleJson.DeserializeObject<Response>(inputString);
					try{
						int pos = inputString.LastIndexOf(':')+1;
						token=inputString.Substring(pos,inputString.LastIndexOf('}')-pos);
					
					}catch(Exception e){
						Debug.WriteLine(e.StackTrace);
					}
					if(token != null){
						mSaveTokenListener.saveToken(token);
					}else{
						mSaveTokenListener.saveToken(sb.ToString());
					}

				}
			
				Debug.WriteLine(response.Content);
			});


		}

		public string getUrlDeep(){
			
			return urlDeepAndroidProduction+token+"&callbackurl="+callback;
		
		}

			



	}
}


