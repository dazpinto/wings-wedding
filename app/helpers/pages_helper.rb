module PagesHelper

  def photo(categorys, title, link)
    cate = categorys.split.map{|n| "cat_#{n}"}.join(' ')
    capture_haml do
      haml_tag :li, {:class=>cate} do
        haml_tag :a, {:title=>title, :href=>link} do
          haml_tag :div do
            haml_tag :img, {:src=>asset_path("photos/#{link}"), :width=>200}
          end
        end
      end
    end
  end

end
