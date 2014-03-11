$('#papers').append('<%= j render partial: "paper", locals: { items: papers } %>');

<% if papers.next_page %>
$('.pagination').replaceWith('<%= j paginate papers %>');
<% else %>
$('.pagination').remove();
<% end %>

