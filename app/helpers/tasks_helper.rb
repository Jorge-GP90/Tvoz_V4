module TasksHelper
    def set_image
        if @task.image?
          @task.image.url
        else
          '/images/default_image.png'
        end
    end
end
