<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
    %>
    <script src="${basePath}/common/adminlte/plugins/bootstrap-treeview/bootstrap-treeview.min.js"></script>
        <section class="content-header">
            <h1>功能/菜单管理</h1>
            <ol class="breadcrumb">
                <li>
                    <a href="${basePath}">
                        <i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li>
                    <a href="#">系统管理</a>
                </li>
                <li class="active">功能/菜单管理</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-md-3">

                    <!-- Profile Image -->
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <div id="tree"></div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
                <div class="col-md-9">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" data-btn-type="addRoot">
                                    <li class="fa fa-plus">&nbsp;新增根菜单</li>
                                </button>
                                <button type="button" class="btn btn-default" data-btn-type="add">
                                    <li class="fa fa-plus">&nbsp;新增下级菜单</li>
                                </button>
                                <button type="button" class="btn btn-default" data-btn-type="edit">
                                    <li class="fa fa-edit">&nbsp;编辑当前菜单</li>
                                </button>
                                <button type="button" class="btn btn-default" data-btn-type="delete">
                                    <li class="fa fa-remove">&nbsp;删除当前菜单</li>
                                </button>
                            </div>
                            <!-- /.box-tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form class="form-horizontal" id="function-form">
                                <input type="hidden" name="parentId" />
                                <div class="form-group">
                                    <label for="parentName" class="col-sm-2 control-label">上级</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" disabled="disabled" id="parentName" name="parentName" placeholder="上级">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">名称</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="名称">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="code" class="col-sm-2 control-label">编码</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="code" name="code" placeholder="编码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="url" class="col-sm-2 control-label">URL</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="url" name="url" placeholder="URL">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="url" class="col-sm-2 control-label">QueryId</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="queryId" name="queryId" placeholder="QueryId">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="levelCode" class="col-sm-2 control-label">层级编码</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="levelCode" name="levelCode" placeholder="层级编码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">菜单类型</label>
                                    <div class="col-sm-9">
                                        <label class="control-label">
                                            <input type="radio" name="functype" class="square-green" value="1"> 菜单
                                        </label> &nbsp;&nbsp;&nbsp;
                                        <label class="control-label">
                                            <input type="radio" name="functype" class="square-green" value="2"> 权限
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="icon" class="col-sm-2 control-label">图标</label>
                                    <div class="col-sm-7">
                                        <i data-bv-icon-for="icon" id="icon_i" class="form-control-feedback fa fa-circle-o" style="right:15px"></i>
                                        <input type="text" class="form-control" id="icon" name="icon" placeholder="图标">
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="button" id="selectIcon" class="btn btn-primary disabled" data-btn-type="selectIcon">
                                            <i class="fa fa-hand-pointer-o">&nbsp;选择图标</i>
                                        </button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pingyin" class="col-sm-2 control-label">拼音</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="pingyin" name="pingyin" placeholder="拼音">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="py" class="col-sm-2 control-label">拼音简写</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="py" name="py" placeholder="拼音简写">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">是否可用</label>
                                    <div class="col-sm-9">
                                        <label class="control-label">
                                            <input type="radio" name="deleted" class="square-green" checked="checked" value="0"> 启用
                                        </label> &nbsp;&nbsp;&nbsp;
                                        <label class="control-label">
                                            <input type="radio" name="deleted" class="square-green" value="1"> 禁用
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="remark" class="col-sm-2 control-label">说明</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" id="remark" name="remark" placeholder="说明"></textarea>
                                    </div>
                                </div>
                                <div class="box-footer" style="display:none">
                                    <div class="text-center">
                                        <button type="button" class="btn btn-default" data-btn-type="cancel">
                                            <i class="fa fa-reply">&nbsp;取消</i>
                                        </button>
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fa fa-save">&nbsp;保存</i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /. box -->
                </div>
            </div>
            <!-- /.row -->

        </section>

        <script>
            //初始化form表单
            var form = null;
            var winId = 'iconWin';
            $(function () {

                form = $('#function-form').form();
                //console.log(form);
                initTree(0); //初始化tree
                //初始化校验
                $('#function-form').bootstrapValidator({
                    message: '请输入有效值',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    submitHandler: function (validator, functionform, submitButton) {
                        modals.confirm('确认保存？', function () {
                            //Save Data，对应'submit-提交'
                            var params = form.getFormSimpleData();
                            ajaxPost(basePath + '/authAction_save.do', params, function (
                                data, status) {
                                if (data.success) {
                                    //var id=$("input[name='id']").val();
                                    var selectedArr = $("#tree").data("treeview").getSelected();
                                    var selectedNodeId = selectedArr.length > 0 ?
                                        selectedArr[0].nodeId : 0;
                                    initTree(selectedNodeId);
                                    toastr.success("保存成功");
                                } else {
                                    toastr.error("保存失败");
                                }
                            });
                        });
                    },
                    fields: {
                        name: {
                            validators: {
                                notEmpty: {
                                    message: '请输入名称'
                                }
                            }
                        },
                        code: {
                            validators: {
                                notEmpty: {
                                    message: '请输入编码'
                                },
                                remote: {
                                    url: basePath + "/authAction_codeCheck.do",
                                    data: function (validator) {
                                        return {
                                            id: $('#id').val(),
                                            code: $('#code').val()
                                        };
                                    },
                                    message: '该编码已被使用'
                                }
                            }
                        },
                        levelCode: {
                            validators: {
                                notEmpty: {
                                    message: '请输入层级编码'
                                }
                            }
                        },
                        functype: {
                            validators: {
                                notEmpty: {
                                    message: '请选择菜单类型'
                                }
                            }
                        },
                        deleted: {
                            validators: {
                                notEmpty: {
                                    message: '请选择是否可用'
                                }
                            }
                        }
                    }
                });
                form.initComponent();
                //按钮事件
                var btntype = null;
                $('button[data-btn-type]').click(function () {
                    var action = $(this).attr('data-btn-type');
                    var selectedArr = $("#tree").data("treeview").getSelected();
                    var selectedNode = selectedArr.length > 0 ? selectedArr[0] : null;
                    //判断当前选中的功能菜单下是否被某个角色绑定
                    function hasRole() {
                        var has = null;
                        ajaxPost(basePath + "/authAction_hasRole.do", {
                            id: selectedNode.id
                        }, function (data) {
                            has = data;
                        });
                        return has;
                    }

                    switch (action) {
                        case 'addRoot':
                            formWritable(action);
                            form.clearForm();
                            $("#icon_i").removeClass();
                            //填充上级菜单和层级编码
                            fillParentAndLevelCode(null);
                            btntype = 'add';
                            break;
                        case 'add':
                            if (!selectedNode) {
                                toastr.warning('请先选择上级字典');
                                return false;
                            }
                            formWritable(action);
                            form.clearForm();
                            $("#icon_i").removeClass();
                            //填充上级菜单和层级编码
                            fillParentAndLevelCode(selectedNode);
                            btntype = 'add';
                            break;
                        case 'edit':
                            if (!selectedNode) {
                                toastr.warning('请先选择要编辑的节点');
                                return false;
                            }
                            if (btntype == 'add') {
                                fillDictForm(selectedNode);
                            }
                            formWritable(action);
                            btntype = 'edit';
                            break;
                        case 'delete':
                            if (!selectedNode) {
                                toastr.warning('请先选择要删除的节点');
                                return false;
                            }
                            if (btntype == 'add')
                                fillDictForm(selectedNode);
                            formReadonly();
                            $(".box-header button[data-btn-type='delete']").removeClass("btn-default").addClass(
                                "btn-primary");
                            if (selectedNode.nodes) {
                                toastr.warning('该节点含有子节点，请先删除子节点');
                                return false;
                            }
                            //判断该功能角色下是否被某个角色绑定
                            if (hasRole().success) {
                                toastr.warning("该功能菜单项已被角色绑定，请先解除绑定");
                                return false;
                            }


                            modals.confirm('是否删除该节点', function () {
                                ajaxPost(basePath + "/authAction_del.do?id=" + selectedNode.id,
                                    null,
                                    function (data) {
                                        if (data.success) {
                                            toastr.success('删除成功');
                                        } else {
                                            modals.info(data.message);
                                        }
                                        //定位
                                        var brothers = $("#tree").data("treeview").getSiblings(
                                            selectedNode);
                                        if (brothers.length > 0)
                                            initTree(brothers[brothers.length - 1].nodeId);
                                        else {
                                            var parent = $("#tree").data("treeview").getParent(
                                                selectedNode);
                                            initTree(parent ? parent.nodeId : 0);
                                        }
                                    });
                            });
                            break;
                        case 'cancel':
                            if (btntype == 'add')
                                fillDictForm(selectedNode);
                            formReadonly();
                            break;
                        case 'selectIcon':
                            var disabled = $(this).hasClass("disabled");
                            if (disabled)
                                break;
                            var iconName;
                            if ($("#icon").val())
                                iconName = encodeURIComponent($("#icon").val());
                            modals.openWin({
                                winId: winId,
                                title: '图标选择器（双击选择）',
                                width: '1000px',
                                url: basePath + "/authAction_iconSelect.do?iconName=" +
                                    iconName
                            });
                            break;
                    }
                });
            })

            //初始化功能权限树
            function initTree(selectNodeId) {
                var treeData = null;
                ajaxPost(basePath + "/authAction_treeData.do", null, function (data) {
                    treeData = data;
                    //console.log(JSON.stringify(treeData));
                });
                $("#tree").treeview({
                    data: treeData,
                    showBorder: true,
                    expandIcon: "glyphicon glyphicon-stop",
                    collapseIcon: "glyphicon glyphicon-unchecked",
                    levels: 1,
                    onNodeSelected: function (event, data) {
                        fillDictForm(data);
                        formReadonly();
                    }
                });
                if (treeData.length == 0)
                    return;
                //默认选中第一个节点
                selectNodeId = selectNodeId || 0;
                $("#tree").data('treeview').selectNode(selectNodeId);
                $("#tree").data('treeview').expandNode(selectNodeId);
                $("#tree").data('treeview').revealNode(selectNodeId);
            }

            //新增时，带入父级菜单名称id,自动生成levelcode
            function fillParentAndLevelCode(selectedNode) {
                $("input[name='parentName']").val(selectedNode ? selectedNode.text : '系统菜单');
                $("input[name='deleted'][value='0']").prop("checked", "checked");
                if (selectedNode) {
                    $("input[name='parentId']").val(selectedNode.id);
                    var nodes = selectedNode.nodes;
                    var levelCode = nodes ? nodes[nodes.length - 1].levelCode : null;
                    $("input[name='levelCode']").val(getNextCode(selectedNode.levelCode, levelCode, 6));
                } else {
                    var parentNode = $("#tree").data("treeview").getNode(0);
                    var levelCode = "000000";
                    if (parentNode) {
                        var brothers = $("#tree").data("treeview").getSiblings(0);
                        levelCode = brothers[brothers.length - 1].levelCode;
                    }
                    $("input[name='levelCode']").val(getNextCode("", levelCode, 6));
                }
            }

            //填充form
            function fillDictForm(node) {
                form.clearForm();
                ajaxPost(basePath + "/authAction_getById.do?id=" + node.id, null, function (data) {
                    form.initFormData(data);
                    fillBackIconName(data.icon);
                })
            }

            //设置form为只读
            function formReadonly() {
                //所有文本框只读
                $("input[name],textarea[name]").attr("readonly", "readonly");
                //隐藏取消、保存按钮
                $("#function-form .box-footer").hide();
                //还原新增、编辑、删除按钮样式
                $(".box-header button").removeClass("btn-primary").addClass("btn-default");
                //选择图标按钮只读
                $("#selectIcon").addClass("disabled");
                //还原校验框
                if ($("function-form").data('bootstrapValidator'))
                    $("function-form").data('bootstrapValidator').resetForm();
            }

            function formWritable(action) {
                $("input[name],textarea[name]").removeAttr("readonly");
                $("#function-form .box-footer").show();
                $(".box-header button").removeClass("btn-primary").addClass("btn-default");
                $("#selectIcon").removeClass("disabled");
                if (action)
                    $(".box-header button[data-btn-type='" + action + "']").removeClass("btn-default").addClass(
                        "btn-primary");
            }

            //回填图标
            function fillBackIconName(icon_name) {
                $("#icon").val(icon_name);
                $("#icon_i").removeClass().addClass("form-control-feedback").addClass(icon_name);
            }
        </script>