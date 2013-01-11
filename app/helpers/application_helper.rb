module ApplicationHelper
  def get_background_url
    "/background/0#{rand(4)+1}.jpg"
  end
end
