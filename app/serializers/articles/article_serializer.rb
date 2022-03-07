module Articles
  class ArticleSerializer < ActiveModel::Serializer
    attributes :id, :url, :title, :user_email, :like, :dislike, :description, :voted, :voted_value

    def url
      "https://www.youtube.com/embed/#{service.video_id}"
    end

    def title
      service.get_title
    end

    def user_email
      object.user.email
    end

    def like
      object.get_upvotes.size
    end

    def dislike
      object.get_downvotes.size
    end

    def description
      service.get_description
    end

    def voted
      return unless current_user

      current_user.voted_for?(object)
    end

    def voted_value
      return unless current_user

      current_user.voted_up_on?(object)
    end

    private

    def service
      @service ||= Articles::ArticleService.new(object.url)
    end

    def current_user
      scope[:current_user]
    end
  end
end
