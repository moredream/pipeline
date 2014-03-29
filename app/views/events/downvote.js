$("#vote").html("<%=j pluralize(@event.cached_votes_up, 'Like') %>")

$("#btn_like").show();
$("#btn_dislike").hide();
