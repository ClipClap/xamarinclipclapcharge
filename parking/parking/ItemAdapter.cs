using System;
using Android.Widget;
using Android.Content;
using System.Collections.Generic;
using parking;
using Android.App;
using Android.Util;
using Android.Views;
using Java.Lang;

namespace parking
{
	public class ItemAdapter  : BaseAdapter<Item> {

		Context mContext;
		List<Item>items;

		public  ItemAdapter (Context context, List<Item> items) 
			:base(){
			mContext = context;
			this.items = items;
			
		}


		public override long GetItemId(int position)
		{
			return position;
		}

		public override Item this[int position] {  
			get { return items[position]; }
		}
		public override int Count {
			get { return items.Count; }
		}

		public override View GetView( int position, View convertView, ViewGroup parent) {

			 ItemViewHolder holder;

			if (convertView == null) {
				         
				LayoutInflater inflater = LayoutInflater.From(mContext);
				convertView = inflater.Inflate(Resource.Layout.item, parent, false);

				//
				holder = new ItemViewHolder();
				holder.count =  convertView.FindViewById <EditText>(Resource.Id.itemCount);
				holder.name =  convertView.FindViewById<EditText>(Resource.Id.itemName);
				holder.value = convertView.FindViewById<EditText>(Resource.Id.itemValue);
				//
				convertView.Tag = holder;

			} else {
				holder = (ItemViewHolder) convertView.Tag;
			}
			holder.populate(this[position]);

			holder.value.Id = position;
			holder.value.FocusChange += (v, args) => {
				if (!args.HasFocus) {
					int pos = holder.value.Id;
					EditText caption = (EditText)v;
					try {
						this[pos].value= Integer.ParseInt (caption.Text.ToString());
					} catch (Java.Lang.Exception e) {
						e.PrintStackTrace ();
						this[pos].value = 0;
					}
				}
			};
				holder.count.Id = position;
			holder.count.FocusChange += (v, args) => {
				if (!args.HasFocus) {
					int pos = holder.count.Id;
					EditText caption = (EditText)v;
					try {
						this[pos].count= Integer.ParseInt (caption.Text.ToString());
					} catch (Java.Lang.Exception e) {
						e.PrintStackTrace ();
						this[pos].count = 0;
					}
				}
			};
				holder.name.Id = position;
			holder.name.FocusChange += (v, args) => {
				if (!args.HasFocus) {
					int pos = holder.name.Id;
					EditText caption = (EditText)v;
					try {
						this[pos].name=  (caption.Text);
					} catch (Java.Lang.Exception e) {
						e.PrintStackTrace ();
						this[pos].name = "";
					}
				}
			};
	


			return convertView;
		}

		 class ItemViewHolder : Java.Lang.Object{
			public EditText value;
			public EditText name;
			public EditText count;

			public void populate( Item item) {
				if(item.value!=0)
					value.Text=(item.value + "");
				else
					value.Text= ( "");
				name.Text=(item.name);
				if(item.count!=0)
					count.Text=(item.count + "");
				else
					count.Text=( "");



			}

		}

	}
}

