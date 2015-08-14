class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  VALID_SCRIPT = /(<script src=("|')https:\/\/gist\.github\.com\/\S+\.js("|')>)(<\/script>)/
  before_save :validate_script

  default_scope {order(created_at: :desc)}

  def validate_script
    content.scan(/<script.*>.*<\/script>/i).each do |c|
       self.content[c] = '' unless c.match(VALID_SCRIPT)
    end
  end
end
