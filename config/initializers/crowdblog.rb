Crowdblog.user_class = 'Identity'

Crowdblog.user_class.class_eval do
  define_method :is_publisher?, -> { true }
end