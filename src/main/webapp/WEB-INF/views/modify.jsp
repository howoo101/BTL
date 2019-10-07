<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="includes/header.jsp" %>
<!--공간띄우는것 필요함. 임시로 br태그사용-->

<div class='bigPictureWrapper'>
    <div class='bigPicture'></div>
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
        align-content: center;
        text-align: center;
    }

    .uploadResult ul li img {
        width: 100px;
    }

    .uploadResult ul li span {
        color: white;
    }

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
        background: rgba(255, 255, 255, 0.5);
    }

    .bigPicture {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .bigPicture img {
        width: 600px;
    }
</style>

<br>
<div class="container center-block mt-4">
    <div class="card border-primary">
        <div class="row">
            <div class="col-lg-12 mt-2 ml-4">
                <h4 class='page-header text-primary font-weight-bold card-title'>작성글
                    수정</h4>
                <hr style="width : 95%;">
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="container center-block mt-4">
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">

                        <div class="panel-heading"></div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="container">
                                <form role="form" action="modify" method="post">
                                    <input type='hidden' name='pageNum'
                                           value='<c:out value="${cri.pageNum }"/>'> <input
                                        type='hidden' name='amount'
                                        value='<c:out value="${cri.amount}"/>'> <input
                                        type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
                                    <input type='hidden' name='keyword'
                                           value='<c:out value="${cri.keyword}"/>'>

                                    <div class="row">
                                        <div class="form-group col-lg-8">
                                            <label>제목</label> <input class="form-control"
                                                                     name='board_title'
                                                                     value='<c:out value="${board.board_title}" />'>
                                        </div>

                                        <div class="form-group col-lg-4">
                                            <label>작성자</label> <input class="form-control"
                                                                      name='board_writer'
                                                                      value='<c:out value="${board.board_writer }"/>'
                                                                      readonly="readonly"
                                                                      style="background-color: white;">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>내용</label>
                                        <textarea class="form-control" rows="10" name='board_content'><c:out
                                                value="${board.board_content}"/></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label>수정일</label> <input class="form-control"
                                                                  name='board_updateDate'
                                                                  value='<fmt:formatDate pattern="yyyy/MM/dd" value = "${board.board_updateDate}" />'
                                                                  readonly="readonly">
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">첨부파일</div>
                                                <!-- /.panel-heading -->
                                                <div class="panel-body">
                                                    <div class="card border-info">
                                                        <div class='uploadResult'>
                                                            <ul>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <!--  end panel-body -->
                                                </div>
                                            </div>
                                            <!--  end panel-body -->
                                        </div>
                                        <!-- end panel -->
                                    </div>
                                    <!-- .row -->
                                    <div class="panel-body">
                                        <div class="for-group uploadDiv">
                                            <input type="file" name='uploadFile' multiple="multiple">
                                        </div>

                                    </div>

                                    <input class="form-control" type='hidden' name='board_id'
                                           value='<c:out value="${board.board_id}" />'>


                                    <!-- 버튼 -->
                                    <br>
                                    <button type="submit" data-oper='modify'
                                            class="btn btn-warning">수정
                                    </button>
                                    <button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
                                    <button type="submit" data-oper='list' class="btn btn-info">List</button>

                                </form>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {


        var formObj = $("form");

        $('button').on("click", function (e) {

            e.preventDefault();

            var operation = $(this).data("oper");

            if (operation === 'remove') {
                formObj.attr("action", "remove");

            } else if (operation === 'list') {
                //move to list
                formObj.attr("action", "list").attr("method", "get");

                var pageNumTag = $("input[name='pageNum']").clone();
                var amountTag = $("input[name='amount']").clone();
                var keywordTag = $("input[name='keyword']").clone();
                var typeTag = $("input[name='type']").clone();

                formObj.empty();

                formObj.append(pageNumTag);
                formObj.append(amountTag);
                formObj.append(keywordTag);
                formObj.append(typeTag);

            } else if (operation === 'modify') {

                var str = "";

                $(".uploadResult ul li").each(function (i, obj) {

                    var jobj = $(obj);

                    str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                    str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                    str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                    str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";

                });
                formObj.append(str).submit();
            }

            formObj.submit();
        });

    });
</script>

<script>

    $(document).ready(function () {
        (function () {

            var board_id = '<c:out value="${board.board_id}"/>';

            $.getJSON("getAttachList", {board_id: board_id}, function (arr) {

                var str = "";

                $(arr).each(function (i, attach) {

                    //image type
                    if (attach.fileType) {
                        var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);

                        str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' "
                        str += " data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
                        str += "<span> " + attach.fileName + "</span>";
                        str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' "
                        str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                        str += "<img src='${path}/display?fileName=" + fileCallPath + "'>";
                        str += "</div>";
                        str += "</li>";
                    } else {

                        str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' "
                        str += "data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
                        str += "<span> " + attach.fileName + "</span><br/>";
                        str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' "
                        str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                        str += "<img src='${path}/resources/img/attach.png'></a>";
                        str += "</div>";
                        str += "</li>";
                    }
                });


                $(".uploadResult ul").html(str);

            });//end getjson
        })();//end function


        $(".uploadResult").on("click", "button", function (e) {

            if (confirm("Remove this file? ")) {

                var targetLi = $(this).closest("li");
                targetLi.remove();
            }
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

        $("input[type='file']").change(function (e) {

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
                contentType: false, data:
                formData, type: 'POST',
                dataType: 'json',
                success: function (result) {
                    showUploadResult(result); //업로드 결과 처리 함수

                }
            }); //$.ajax

        });

        function showUploadResult(uploadResultArr) {

            if (!uploadResultArr || uploadResultArr.length == 0) {
                return;
            }

            var uploadUL = $(".uploadResult ul");

            var str = "";

            $(uploadResultArr).each(function (i, obj) {

                if (obj.image) {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                    str += "<li data-path='" + obj.uploadPath + "'";
                    str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath + "\' ";
                    str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                    str += "<img src='${path}/display?fileName=" + fileCallPath + "'>";
                    str += "</div>";
                    str += "</li>";
                } else {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                    var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

                    str += "<li ";
                    str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "' ><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' "
                    str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                    str += "<img src='${path}/resources/img/attach.png'></a>";
                    str += "</div>";
                    str += "</li>";
                }

            });

            uploadUL.append(str);
        }

    });
</script>


<%@ include file="includes/footer.jsp" %>