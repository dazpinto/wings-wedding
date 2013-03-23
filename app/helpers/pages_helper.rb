module PagesHelper

  def photo(categorys, title, link)
    cate = categorys.split.map{|n| "cat_#{n}"}.join(' ')
    capture_haml do
      haml_tag :li, {:class=>cate} do
        haml_tag :a, {:title=>title, :href=>link} do
          haml_tag :div, :class=>'test_image'
        end
      end
    end
  end

end
