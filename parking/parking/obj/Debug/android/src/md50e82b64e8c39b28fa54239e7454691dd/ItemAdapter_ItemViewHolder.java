package md50e82b64e8c39b28fa54239e7454691dd;


public class ItemAdapter_ItemViewHolder
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer
{
	static final String __md_methods;
	static {
		__md_methods = 
			"";
		mono.android.Runtime.register ("parking.ItemAdapter+ItemViewHolder, parking, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", ItemAdapter_ItemViewHolder.class, __md_methods);
	}


	public ItemAdapter_ItemViewHolder () throws java.lang.Throwable
	{
		super ();
		if (getClass () == ItemAdapter_ItemViewHolder.class)
			mono.android.TypeManager.Activate ("parking.ItemAdapter+ItemViewHolder, parking, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", "", this, new java.lang.Object[] {  });
	}

	java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
