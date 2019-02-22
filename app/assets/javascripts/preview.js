//befor_imageプレビュー
$(function() {
    $('#before-sample').on('change', function(e) {
        // 1枚だけ表示する
        var file = e.target.files[0];

        // ファイルのブラウザ上でのURLを取得する
        var blobUrl = window.URL.createObjectURL(file);

        // img要素に表示
        $('#before-preview').attr('src', blobUrl);
    });
});

//after_imageプレビュー
$(function() {
    $('#after-sample').on('change', function(e) {
        // 1枚だけ表示する
        var file = e.target.files[0];

        // ファイルのブラウザ上でのURLを取得する
        var blobUrl = window.URL.createObjectURL(file);

        // img要素に表示
        $('#after-preview').attr('src', blobUrl);
    });
});

//user.avatarプレビュー
$(function() {
    $('#file-user').on('change', function(e) {
        // 1枚だけ表示する
        var file = e.target.files[0];

        // ファイルのブラウザ上でのURLを取得する
        var blobUrl = window.URL.createObjectURL(file);

        // img要素に表示
        $('#user-image').attr('src', blobUrl);
    });
});
