using System;

using UIKit;
using clipclapcharge;

namespace IOSparking
{
	public partial class ViewController : UIViewController, SaveTokenListener
	{
		CCService ccService = new CCService(CCService.DEVELOPMENT);

		public ViewController (IntPtr handle) : base (handle)
		{
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			// Perform any additional setup after loading the view, typically from a nib.
		}

		public override void DidReceiveMemoryWarning ()
		{
			base.DidReceiveMemoryWarning ();
			// Release any cached data, images, etc that aren't in use.
		}

		partial void UIButton3_TouchUpInside (UIButton sender)
		{

			//Initialize with your secretKey
			CCBilleteraPayment cc = new CCBilleteraPayment ("pKFe1P2iYw6z73srBDBx");

			//Add an Item with tax
			cc.addItem ("item1", 100, 200, CCBilleteraPayment.IVA_REGULAR_16_);
			//Add an Item without tax
			cc.addItem ("item1", 100, 200);

			//Add Total, description, netTotal, tax, tip
			cc.addTotal ("total", 100, 200,20);

			ccService.setJson(cc.getJSON());
			ccService.setCallBack("iosParking://");
			try
			{
				ccService.setSaveTokenListener(this);
				ccService.getToken();
			}
			catch(Exception e)
			{
				//Show error message to the user
			}
		}

		public void saveToken(string content)
		{
			string link = ccService.getUrlDeep ();

			try 
			{
				InvokeOnMainThread (delegate {  
					UIApplication.SharedApplication.OpenUrl(new Foundation.NSUrl(link));
				});
			} catch (Exception ex) {

				//Show error message to the user
			}
		}
	}
}

