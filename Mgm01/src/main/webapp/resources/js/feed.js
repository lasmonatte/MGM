/**
 * 
 */
var list = new Array();
$(document).ready(function() {
   if ($('#pageType').attr('data-init') == null) {
      $('#pageType').attr('data-init', '_');
      moreFeed();
   }
});
$(document).ready($(".timeago").each(function() {
   var timeago_t = jQuery.timeago($(this).data("date"));
   $(this).text(timeago_t);
}));
$('.writeReply')
      .keyup(
            function(event) {
               var input = $(this);
               if (event.keyCode == 13 && input.val().length > 0) {
                  writeReply(input); // 한글자 이상이라면 저장
               } else if ((event.keyCode == 32 || event.keyCode == 37 || event.keyCode == 39)
                     && input.val().length > 1) {
                  saveReplyList(input); // 스페이스(32),좌측(37),우측(39)눌렀으므로
                  // 저장
               } else {
                  replySearch(input); // list랑 input @배열 비교 후 일치하지않으면 팝업창
                  // open
               }
            });

function writeReply(input) { // 일단 popup에서만 작동함 - feed_init(feed_num) 작성필요
   var feed_num = input.attr('data-feed_num'); // 글작성한곳의 feed_num 뽑아냄.
   var callId = list.join('@'); // 보내줘야함 - 얘기필요
   $.ajax({ // feed_num과 input으로 댓글작성하는 inner 작동.
      method : 'POST', // post!
      url : '/AppleMango/reply/write.in', // url
      dataType : 'html', // 안받을건데 그냥 일단 적어놓음 ... 지워도되나.
      data : { // 데이타!
         content : input.val(), // 지금 댓글작성했던 value
         feed_num : feed_num
      // 글번호 (글의 value를 글번호에 맞게 저장, 아이디는 auth에서)
      }
   }).success(function(msg) { // 댓글작성이 성공하면
      input.val(''); // 댓글창의 내용을 초기화함
      if ($('#pageType').attr('data-pageType') != 'newsFeed') { // 댓글작성한곳이
         // newsfeed인지
         dialogOpen(feed_num); // 뉴스피드 아니면 dialogopen 을 실행
      } else { // 뉴스피드면
         $('#reply' + feed_num).attr('data-replyCount', msg); // 남은 reply
         // 세팅 다시하고
         $('#reply' + feed_num).html('');
         reply(feed_num);
      }
   });
}
function saveReplyList(input) {
   var arr = input.val().split('@');
   if (arr.length > 1) { // 골뱅이가 하나라도있으면 저장해야지
      list = new Array(); // 초기화후
      for (var i = 1; i < arr.length; i++) { // 0번째는 버리고, 1~끝
         list.push(arr[i].split(' ')[0]); // 저장 하고
         $('#writeSearch' + input.attr('data-feed_num')).attr('style',
               'display:none');
         // $('#replySearch'+feed_num).attr('style','display:none'); // 창숨기고
      }// for i(골뱅이)
   }// 골뱅이가 하나도없으면 그냥 pass
}
function replySearch(input) {
   var feed_num = input.attr('data-feed_num');
   var arr = input.val().split('@'); // 글에 골뱅이가있으면 [1]으로 나옴
   if (arr.length > 1) { // 1보다 크면(골뱅이가 하나라도 있으면)
      for (var i = 1; i < arr.length; i++) { // 골뱅이 1번~끝번
         var search = arr[i].split(' ')[0]; // 하나를 넣고
         if (list.indexOf(search) < 0) {// list에 지금 보고있는 골뱅이가 없다면
            $.ajax({ // ajax로 없는애의 글씨를 포함하는 애를 search
               method : 'GET',
               url : '/AppleMango/write/search_inner.in',
               dataType : 'html',
               data : {
                  feed_num : feed_num,
                  search : search
               // 서치라는 이름으로 검색어 - 넘어감
               }
            }).success(
                  function(msg) { // 리턴은 writesearch_inner 로 하고.]

                     if (msg.length > 11) {
                        $('#writeSearch' + feed_num).html(msg);
                        $('#writeSearch' + feed_num).attr('style',
                              'display:block'); // 그리고 오픈
                     } else {
                        $('#writeSearch' + feed_num).attr('style',
                              'display:none'); // 혹시나 닫아쥼
                     }
                  })
         }
      }
   } else {// 골뱅이도없냐
      $('#writeSearch' + feed_num).attr('style', 'display:none');
   }
}
function search_id_press(feed_num, search_num) {
   var id = $('#write_searchId_' + feed_num + '_' + search_num)
         .attr('data-id');
   $('#writeReply' + feed_num).val();
   var arr = $('#writeReply' + feed_num).val().split('@');
   for (var i = 1; i < arr.length; i++) { // 골뱅이 1번~끝번
      var search = arr[i].split(' ')[0]; // 하나를 넣고
      if (list.indexOf(search) < 0) {// list에 지금 보고있는 골뱅이가 없다면
         arr[i] = id + " ";
         $('#writeReply' + feed_num).val(arr.join('@'));
         saveReplyList($('#writeReply' + feed_num));
         $('#writeReply' + feed_num).focus();
      }
   }
}
function dialogOpen(feed_num) {
   $.post('/AppleMango/feed/feed.it', {
      feed_num : feed_num
   }).success(function(msg) {
      $('#dialogBody').html(msg);
      reply(feed_num);
      goodCheck(feed_num);
      $('#writeReply' + feed_num).focus();
   });
}

function reply(feed_num) {
   var replyCount = $('#reply' + feed_num).attr('data-replyCount');
   var count = 10;
   if (replyCount < count) {
      count = replyCount;
   }
   if (replyCount > 0) {
      $.ajax({
         method : 'GET',
         url : '/AppleMango/reply/read.it',
         dataType : 'html',
         data : {
            start : replyCount - count,
            count : count,
            feed_num : feed_num
         }
      }).success(
            function(msg) {
               $('#reply' + feed_num).attr('data-replyCount',
                     replyCount - count);
               $('#reply' + feed_num).html(
                     (msg + $('#reply' + feed_num).html()));
               if (replyCount - count == 0) {
                  $('#replybutton' + feed_num).html('더이상 댓글이 존재하지 않습니다');
               } else {
                  $('#replybutton' + feed_num).html(
                        '댓글 <span class="badge">'
                              + (replyCount - count) + '</span>');
               }
            })
   } else {
      $('#replybutton' + feed_num).html('더이상 댓글이 존재하지 않습니다');
   }
}
function good(feed_num) {
   var isLiked = $('.goodDiv' + feed_num).attr('data-isLiked');
   var url;
   if (isLiked == 'false') {
      url = '/AppleMango/good/write.it'
   } else {
      url = '/AppleMango/good/delete.it'
   }
   $.ajax({
      method : 'POST',
      url : url,
      dataType : 'html',
      data : {
         feed_num : feed_num,
      }
   }).success(function(msg) {
      $('#good_count' + feed_num).html(msg);
      if (isLiked == 'false') {
         isLiked = 'true'
      } else {
         isLiked = 'false'
      }
      $('.goodDiv' + feed_num).attr('data-isLiked', isLiked);
      goodCheck(feed_num);
   })
}
function goodCheck(feed_num) {
   if ($('.goodDiv' + feed_num).attr('data-isLiked') == 'true') {
      $('#goodButton' + feed_num).attr("class", "form-control heartRed");
      $('.goodDiv' + feed_num).attr('data-isLiked', true);
   } else {
      $('#goodButton' + feed_num).attr("class", "form-control heartDefault");
      $('.goodDiv' + feed_num).attr('data-isLiked', false);
   }
}
function modify(feed_num) {
   $('.feed_content').attr('style', 'display:none');
   $('.modify_content').attr('style', 'display:block');
}
function follow() {
   var url;
   if ($('#follow').attr('data-isfollow') == 'false') {
      url = '/AppleMango/follow/apply.it'
   } else {
      url = '/AppleMango/follow/delete.it'
   }
   $.ajax({
      method : 'POST',
      url : url,
      dataType : 'html',
      data : {
         recipient_id : $('#follow').attr('data-followId')
      }
   }).success(function() {
      if ($('#follow').attr('data-isfollow') == 'true') {
         $('#follow').attr('data-isfollow', 'false');
         $('#follow').attr('class', 'btn btn-default');
      } else {
         $('#follow').attr('data-isfollow', 'true');
         $('#follow').attr('class', 'btn btn-warning');
      }
   })
}
function moreFeed() {
	var count = 12; // moreFeed를 눌렀을때 기본값으로 feed의 수는 12를 잡는다.
	var pageType = $('#pageType').attr('data-pageType');
	var option = $('#pageType').attr('data-option');
	var feedCount = $('#pageType').attr('data-feedCount'); // 해당페이지의 list.size
	// 207
	var start = feedCount - count;

	if ($('#pageType').attr('data-pageType') == null) {
		$('#moreButton').remove();
		return false;
	}

	if (start < 0) {
		start = 0;
	}
	if (feedCount <= 0 || feedCount == null) { // 방금전에 가져온 feedList가 12개가
		// 아니거나, count가 end라면
		// $('#feedListSize').attr('data-listsize')
		// != count ||
		$('#moreButton').attr('value', '더이상\n글이 존재하지 않습니다');
		$('#moreButton').attr('onclick', '#');// 부르는애도 버려버림
	} else { // 이번에 가져올게 있다면
		$.ajax({
			method : 'POST',
			url : '/AppleMango/feed/morefeed.it',
			dataType : 'html',
			data : {
				start : start, // 남은글-카운트 ~ 카운트갯수
				count : count,
				pageType : pageType,
				option : option
			}
		}).success(function(msg) { // return morefeed_inner.jsp
			$('#center').html($('#center').html()+msg);
			$('#pageType').attr('data-feedCount', feedCount - count);
			$('#moreButton').blur();
		})
	}
}