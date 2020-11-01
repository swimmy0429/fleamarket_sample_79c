console.log(1);
$(document).on('turbolinks:load', ()=> {
  console.log('change');

  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${num}][src]"
                    id="item_item_images_attributes_${num}_src"><br>

                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<div class="image-box">
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);




  $('.hidden-destroy').hide();
  $('#image-box').on('change', '.js-file', function(e)  {
    const targetIndex = $(this).parent().data('index');
    console.log(2);
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      console.log(3);
      
      //appendではなく、prependで要素を前から表示
      $('#previews').prepend(buildImg(targetIndex, blobUrl));
       // 画像投稿枚数10枚まで
      if($(".js-file_group").length >= 10){
        return false;
      } else {

      // attrを使って画像が投稿される度にlabelのfor属性を変える(0→1→2)
      $('label.item_image').attr("for", `item_item_images_attributes_${targetIndex + 1}_src`);
      console.log(4);

      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      console.log(5);

      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      }
    }



  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).prev().data('index');
    const inputField = $(`#item_item_images_attributes_${targetIndex}_src`)
    console.log(inputField)
    inputField.remove();

    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove()
    $(`img[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').prepend(buildFileField(fileIndex[0]));
  });
});


//プレビュー上段、下段の条件分岐
