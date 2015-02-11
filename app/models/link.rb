class Link < ActiveRecord::Base
  validates_presence_of :long

  before_create :create_short_link

  private

  def create_short_link
    if find_duplicate_record(self)
      self.short = @result.short
    else
      self.short = [('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a].reduce(:+).sample(8).join
    end
  end

  def find_duplicate_record(link)
    @result = Link.find_by_long(link.long)
  end
  
end
