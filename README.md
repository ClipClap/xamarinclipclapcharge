
## ClipClapCharge Framework  para Xamarin iOS y Android##

ClipClap te permite incorporar la acción de pagar en tu aplicación Xamarin iOS y Android de forma fácil y rápida. Solo debes agregar el framework que te brindamos y los pagos serán gestionados por la aplicación Billetera de ClipClap.
Te recordamos que para poder hacer de esta integración debes descargar la aplicación de Billetera ClipClap en la AppStore o Google Play.

## Prerrequisitos ##

 1. ***Tener una cuenta ClipClap Datáfono:***
Para poder realizar la integración con ClipClap debes primero tener una cuenta en ClipClap Datáfono, puedes hacer el proceso de registro siguiendo este [link](https://clipclap.co/datafono/dashboard/php/views/signup.php) o desde la misma aplicación ClipClap Datáfono.

 2. ***Tener el secretKey de tu negocio:***
Una vez tengas tu usuario Datáfono, tendrás que tener a la mano el “secreKey” de tu negocio, puedes consultar los pasos para adquirirlos en detalle [aquí](https://clipclap.co/datafono/dashboard/php/views/settings.php).

 3. **ClipClap Billetera para tus clientes:**
Para que tus usuarios puedan acceder al evento de pago de ClipClap deben tener instalada la aplicación Billetera, esta permitirá realizar los pagos de forma rápida y segura para tus clientes.

 4. ***Entorno de Prueba y Entorno de Producción:***
Recuerda que puedes cambiar entre entorno de prueba y de producción, para llevar un mayor control de tu integración. puedes cambiarlo en el siguiente [link](https://clipclap.co/datafono/dashboard/php/views/settings.php).


## Integración ##

Sigue los siguientes pasos para conocer cómo se debe integrar el framework de pago ClipClap en tu aplicación Xamarin iOS y Android. Recuerda descargar la librería clipclapcharge, dentro el PCL (Portable class Library) para integrar a tu proyecto. Los proyectos IOSParking y parking son ejemplos sencillos de IOS y Android respectivamente que utilizan la librería clipclapcharge:

**Paso 1: En el proyecto de Xamarin Studio de tu aplicación integra el framework así:**

![enter image description here](http://www.clipclap.co/docs/tutorials/xamarin/img/1.png)

![enter image description here](http://www.clipclap.co/docs/tutorials/xamarin/img/2.png)

![enter image description here](http://www.clipclap.co/docs/tutorials/xamarin/img/6.png) 

![enter image description here](http://www.clipclap.co/docs/tutorials/xamarin/img/4.png)

![enter image description here](http://www.clipclap.co/docs/tutorials/xamarin/img/5.png)


**Paso 2: Configurar el cobro.**

Importa el *ClipClapCharge framework* en la clase donde la vayas a usar :

    using clipclapcharge;
    
En tu clase implementa SaveTokenListener:

    public partial class YOUR_CLASS_NAME : SUPER_CLASS_NAME, SaveTokenListener

Inicializa el servicio que se encargará de abrir ClipClap Billetera:

    CCService ccService = new CCService();
    
Para obtener respuesta de la aplicación ClipClap Billetera cuando el cobro se haya realizado:
    
    ccService.setCallBack("YOUR_URL_SCHEME://" ó "UNIVERSAL_LINKING");    

Con la llave secreta que obtienes abriendo una cuenta ClipClap Datáfano:

    CCBilleteraPayment cc = new CCBilleteraPayment("YOUR_SECRET_KEY");

Hay dos forma de crear un cobro para que ClipClap Billetera lo gestione:

 1) *Forma 'producto por producto':* Esta opción permite agregar al cobro productos de forma individual especificando su nombre, precio, cantidad y el impuesto que se le aplica al producto. Así: 
    
    //Por cada producto haga esto:
    string nombreProducto = @"Camisa Polo";
    int precio = 25000;
    int cantidad = 3;
    
    //Si lo quiere CON impuesto
    cc.addItem (nombreProducto, cantidad, precio, CCBilleteraPayment.IVA_REGULAR_16_);
    
    //Si lo quiere SIN impuesto
    cc.addItem (nombreProducto, cantidad, precio);


2) *Forma 'total-impuesto-propina':* Esta opción permite definir el total a cobrar de forma inmediata especificando el total a cobrar sin impuestos, el impuesto sobre el total y de forma opcional la propina. Así:

    string descripcion = @"Dos perros calientes y una gaseosa";
    int totalSinImpuesto = 20000;
    int impuesto = 1600; //Se aplicó Consumo Regular del 8% sobre el total sin impuesto.
    int propina = 2000   //Esto es opcional.
    
    //Así para SI incluir propina.
    cc.addTotal (descripcion, totalSinImpuesto, impuesto, propina);
	    
    //Así para NO incluir propina.
    cc.addTotal (descripcion, totalSinImpuesto, impuesto, 0);                                        

> ***Nota:*** Estas dos formas de crear el cobro son mutuamente excluyentes. Si usted utiliza ambas formas al mismo tiempo, la *forma 'total-impuesto-tip'* prevalece sobre la *forma 'producto-por-producto'*.

> ***Nota:*** Si en su cuenta de ClipClap Datáfono tiene lo opción de propina deshabilitada, la opción de pagar con propina en ClipClap Billetera NO aparecerá.

**Paso 3: Decirle a ClipClap Billetera que realice el cobro**

    //Obteniendo de ClipClap un token único para este cobro. Hasta este momento todavía el cobro no se ha hecho efectivo.
    
    try
	{
		//Registrando esta instancia con la interfaz 'SaveTokenListener'.
		ccService.setSaveTokenListener(this);

		//Obteniendo de CliClap el token del cobro.
		ccService.getToken();
	}
	catch(Exception e)
	{
		//Mostrar al usuario el error
	}

	.
	.
	.

	//Implementando el método de la interfaz 'SaveTokenListener'
	public void saveToken(string content){

		//Obteniendo el url para abrir ClipClapBilletera
		string link = ccService.getUrlDeep ();
		
		try 
		{
			/*Para abrir ClipClap Billetera en Xamarin iOS*/				
			InvokeOnMainThread (delegate {  
				UIApplication.SharedApplication.OpenUrl(new Foundation.NSUrl(link));
			});
			
			//--------------------------------
			
			/*Para abrir ClipClap Billetera en Xamarin Android*/
			var uri = Android.Net.Uri.Parse (link);
            var intent = new Intent (Intent.ActionView, uri);
            StartActivity (intent);
		
		} catch (Exception ex) {
                           	/*Para abrir ClipClap Billetera APPSTORE*/				
			InvokeOnMainThread (delegate {  
				UIApplication.SharedApplication.OpenUrl(new Foundation.NSUrl(
				CCBilleteraPayment.BILLETERA_APPSTORE));
			});
			
				/*Para abrir ClipClap Billetera PLAYSTORE*/
		         	var uri = Android.Net.Uri.Parse (CCBilleteraPayment.BILLETERA_PLAYSTORE);
				var intent = new Intent (Intent.ActionView, uri);
				StartActivity (intent);	
		}
	}
		

> ***IMPORTANTE:*** Si al momento de guardar el ´token´ en su sistema de información este falla, no convoque a ClipClap Billetera para que gestione el pago.


## Tipos de impuesto ##

    IVA_REGULAR_16_ => IVA Regular del 16%
    IVA_REDUCIDO_5 => IVA Reducido del 5%
    IVA_EXCENTO_0 => IVA 0%
    IVA_EXCLUIDO_0 => IVA 0%
    CONSUMO_REGULAR_8 => Consumo Regular 8%
    CONSUMO_REDUCIDO_4 => Consumo Reducido 4%
    IVA_AMPLIADO_20 => IVA Ampliado 20%

## Respuesta por parte de ClipClap Billetera ##

Cuando ClipClap Billetera a ha finalizado el cobro, este responde de tres maneras a la aplicación que solicitó sus servicios. Así:

***Para iOS 9 o superior:***

Si el cobro se realizó exitosamente:

    "Your universal linking?response=ok"

Si el cobro fue rechazado por el cliente:
  
    "Your universal linking?response=cancel" //El cobro fue rechazado por el cliente.

Si hubo un error realizando el cobro:

    "Your universal linking?response=error&message=Mostrar este error en tu aplicación Xamarin iOS"

***Para iOS 8.4.1 o anterior***

Si el cobro se realizó exitosamente:

    "Your_URL_Scheme://?response=ok"

Si el cobro fue rechazado por el cliente:
  
    "Your_URL_Scheme://?response=cancel" //El cobro fue rechazado por el cliente.

Si hubo un error realizando el cobro:

    "Your_URL_Scheme://?response=error&message=Mostrar este error en tu aplicación Xamarin iOS"
    
***Para Android***

Si el cobro se realizó exitosamente:

    "Your_URL?response=ok"

Si el cobro fue rechazado por el cliente:
  
    "Your_URL?response=cancel" //El cobro fue rechazado por el cliente.

Si hubo un error realizando el cobro:

    "Your_URL?response=error&message=Mostrar este error en tu aplicación Xamarin iOS"




