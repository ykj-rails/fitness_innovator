// 1枚目
$(function() {
    $('#file-sample').on('change', function(e) {
        // 1枚だけ表示する
        var file = e.target.files[0];

        // ファイルのブラウザ上でのURLを取得する
        var blobUrl = window.URL.createObjectURL(file);

        // img要素に表示
        $('#file-preview').attr('src', blobUrl);
    });
});

// 2枚目
$(function() {
    $('#file-sample2').on('change', function(e) {
        // 1枚だけ表示する
        var file = e.target.files[0];

        // ファイルのブラウザ上でのURLを取得する
        var blobUrl = window.URL.createObjectURL(file);

        // img要素に表示
        $('#file-preview2').attr('src', blobUrl);
    });
});
