$("turbolinks:load", function(){
  $(function() {
    let search_list = $(".main__groups");

    function appendGroup(group) {
      let html =
      `<div class="skyarea">
        <a class="skyarea_img" href="/groups/${group.id}/messages">
          <img class="group-image" src="${group.image_url}">
        </a>
        <div class="skyarea__name">
          <a href="/groups/${group.id}/messages">
            ${group.name}
          </a>
        </div>
      </div>`
      search_list.append(html);
    }

    function appendErrMsgToHTML(msg) {
      let html = `<div class='name'>${ msg }</div>`
      search_list.append(html);
    }

    $(".search-input").on("keyup", function() {
      let input = $(".search-input").val();
      $.ajax({
        type: 'GET',
        url: '/groups/search',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(groups) {
        search_list.empty();
        if (groups.length !== 0) {
          groups.forEach(function(group){
            appendGroup(group);
          });
        }
        else {
          appendErrMsgToHTML("一致するグループがありません");
        }
      })
      .fail(function() {
        alert('error');
      });
    });
  });
});