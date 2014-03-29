$("#vote").html("<%=j pluralize(@event.cached_votes_up, 'Like') %>")

$("#btn_like").hide();
$("#btn_dislike").show();
