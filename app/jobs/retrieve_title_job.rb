class RetrieveTitleJob < ApplicationJob
  queue_as :default

  def perform(friendly_url)
    Url.get_title(friendly_url)
  end
end
