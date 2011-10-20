module PublicationsHelper
  def has_subject?(subject)
    if @publication 
        @publication.subjects.include?(subject)
    else
        false
    end
end
end
