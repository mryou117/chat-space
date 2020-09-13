$(function(){
  function buildHTML(message){
    if ( message.image ) {
      let html =
        `<div class="main-chat__message-list__message-box">
          <ul class="message-data">
            <li class="message-data__user-name">
              ${message.user_name}
              <div class="message-data__user-name__date-time">
                ${message.created_at}
              </div>
            </li>
            <li class="message-data__message">
              ${message.content}
            </li>
            <img class="Message__image" src="${message.image}">
          </ul>
        </div>`
        // img class位置調整の必要あるかも
      return html;
    } else {
      let html =
        `<div class="main-chat__message-list__message-box">
          <ul class="message-data">
            <li class="message-data__user-name">
              ${message.user_name}
              <div class="message-data__user-name__date-time">
                ${message.created_at}
              </div>
            </li>
            <li class="message-data__message">
              ${message.content}
            </li>
          </ul>
        </div>`
      return html;
    };
  }

  $('.Form').on('submit', function(e){
    e.preventDefault()
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data)
      $('.main-chat__message-list').append(html) .animate({ scrollTop: $('.main-chat__message-list')[0].scrollHeight});
      // $('input[name="commit"]').prop('disabled', false);
      $('.submit-btn').prop('disabled', false);
      $('form')[0].reset();
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  });
});