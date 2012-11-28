require './lib/config'

class SinatraApp
  helpers do
    def link_to(url, link)
      capture_haml do
        haml_tag :a, :<, :>, href: url do
          haml_concat link
        end
      end.strip
    end

    def image_tag(name)
      capture_haml do
        haml_tag :img, :/, src: "/images/#{name}", alt: name
      end.strip
    end

    def social_tag(icon, link)
      tooltip = icon
      tooltip = 'email' if icon == 'envelope-alt'
      tooltip = 'blog' if icon == 'book'

      capture_haml do
        haml_tag :li, :< do
          haml_tag :a, :<, href: link, target: '_blank', "data-tooltip" => tooltip.capitalize do
            haml_tag :i, :<, class: "icon-#{icon} icon-large"
          end
        end
      end.strip
    end

    def project_tag(project, image, url)
      capture_haml do
        haml_tag 'li.project' do
          haml_tag 'a.photo', :<, href: url, target: '_blank' do
            haml_tag :img, src: image
          end
          haml_tag 'a.caption', :<, href: url, target: '_blank' do
            haml_concat project
          end
        end
      end.strip
    end
  end

 # Home Page
  get '/' do
    haml :index
  end
end
