module FlickrHelper
	
	def render_flickr_sidebar_widget(user_id)
		@photos = group_photos(user_id)
		render "flickr/sidebar_widget"
	end

	def group_photos(user_id,col_width = 2)
		photos = get_photo_array(user_photos(user_id))
		grouped_photos = photos.in_groups_of(col_width)
	end

	def get_photo_array(photos)
		photo_array = []
		photos.each do |p|
			info = flickr.photos.getInfo(photo_id: p.id)
			photo = {url: FlickRaw.url_s(info), title: p.title, photo_page: FlickRaw.url_photopage(info)}
			photo_array << photo
		end
		photo_array
	end

	def user_photos(user_id, photo_count = 12)
		flickr.photos.search(user_id: user_id, per_page: photo_count)
	end


end
