<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>

<div class='bigPictureWrapper'>
    <div class='bigPicture'>
    </div>
</div>

<style>
    .uploadResult {
        width: 100%;
        background-color: gray;
    }

    .uploadResult ul {
        display: flex;
        flex-flow: row;
        justify-content: center;
        align-items: center;
    }

    .uploadResult ul li {
        list-style: none;
        padding: 10px;
    }

    .uploadResult ul li img {
        width: 100px;
    }
</style>

<style>
    .bigPictureWrapper {
        position: absolute;
        display: none;
        justify-content: center;
        align-items: center;
        top: 0%;
        width: 100%;
        height: 100%;
        background-color: gray;
        z-index: 100;
    }

    .bigPicture {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>


<div class='uploadDiv'>
    <input type='file' name='uploadFile' multiple>
</div>

<div class='uploadResult'>
    <ul>

    </ul>
</div>


<button id='uploadBtn'>Upload</button>

<!-- script -->
<script>

    function showImage(fileCallPath) {

        //alert(fileCallPath);

        $(".bigPictureWrapper").css("display", "flex").show();

        $(".bigPicture")
            .html("<img src='${path}/display?fileName=" + encodeURI(fileCallPath) + "'>")
            .animate({width: '100%', height: '100%'}, 1000);

    }

    $(".bigPictureWrapper").on("click", function (e) {
        $(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
        setTimeout(function () {
            $(this).hide();
        }, 1000);
    });


    $(".uploadResult").on("click", "span", function (e) {

        var targetFile = $(this).data("file");
        var type = $(this).data("type");

        $.ajax({
            url: '${path}/deleteFile',
            data: {fileName: targetFile, type: type},
            dataType: 'text',
            type: 'POST',
            success: function (result) {
                alert(result);
            }
        }); //$.ajax

    });


    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    var maxSize = 5242880; //5MB

    function checkExtension(fileName, fileSize) {

        if (fileSize >= maxSize) {
            alert("파일 사이즈 초과");
            return false;
        }

        if (regex.test(fileName)) {
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return false;
        }
        return true;
    }

    var cloneObj = $(".uploadDiv").clone();

    $("#uploadBtn").on("click", function (e) {

        var formData = new FormData();
        var formData = new FormData();
        var inputFile = $("input[name='uploadFile']");

        var files = inputFile[0].files;

        for (var i = 0; i < files.length; i++) {

            if (!checkExtension(files[i].name, files[i].size)) {
                return false;
            }

            formData.append("uploadFile", files[i]);

        }

        $.ajax({
            url: '${path}/uploadAjaxAction',
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            dataType: 'json',
            success: function (result) {

                showUploadedFile(result);

                $(".uploadDiv").html(cloneObj.html());

            }
        }); //$.ajax

    });

    var uploadResult = $(".uploadResult ul");


    function showUploadedFile(uploadResultArr) {

        var str = "";

        $(uploadResultArr).each(function (i, obj) {

            if (!obj.image) {

                var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

                var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

                str += "<li><div><a href='${path}/download?fileName=" + fileCallPath + "'>" +
                    "<img src='${path}/resources/img/attach.png'>" + obj.fileName + "</a>" +
                    "<span data-file=\'" + fileCallPath + "\' data-type='file'> x </span>" +
                    "<div></li>"

            } else {

                var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;

                originPath = originPath.replace(new RegExp(/\\/g), "/");

                str += "<li><a href=\"javascript:showImage(\'" + originPath + "\')\">" +
                    "<img src='display?fileName=" + fileCallPath + "'></a>" +
                    "<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span>" +
                    "<li>";
            }
        });

        uploadResult.append(str);
    }

</script>
<%@ include file="includes/footer.jsp" %>
