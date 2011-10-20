<%= remotipart_response do %>
 
  $('#document_list').append( '<%= escape_javascript( render :partial => "new", :locals => {:document => @document}) %>' );
<% end %>

