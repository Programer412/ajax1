class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end

# console.log("create post");
#
# // Append new post to the table
# $("#posts tbody").append(`
#     <tr id="post_<%= @post.id %>">
#       <td><%= @post.title %></td>
#       <td><%= @post.description %></td>
#       <td style="display: flex">
#         <%= link_to 'Show', post_path(@post), style: 'margin-left:4px' %>
#         <%= link_to 'Edit', edit_post_path(@post), style: 'margin-left:4px' %>
#         <%= link_to 'Delete', post_path(@post), method: :delete, data: { turbo_confirm: 'Are you sure that you want to delete this post?' }, remote: true, style: 'margin-left:4px' %>
#       </td>
#     </tr>
#   `);
#

# $("form")[0].reset();
#

# console.log("Form reset");
#

# console.log($("#posts tbody").html());
