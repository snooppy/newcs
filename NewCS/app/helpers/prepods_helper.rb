module PrepodsHelper
  def has_subject?(subject)
    if @prepod 
        @prepod.subjects.include?(subject)
    else
        false
    end
end
end
