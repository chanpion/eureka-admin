<!DOCTYPE html>
<html>
<head>
  <base href="/adminlte/">
  <#include "common/layout.ftl" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Eureka</title>
  <@style/>
</head>
<body class="sidebar-mini skin-blue-light wysihtml5-supported">
	<div class="wrapper">
		<@header/>
		<@menu/>
		<div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    服务列表
                </h1>
            </section>

            <!-- Main content -->
            <section class="content" id="content">
              <div class="row">
                  <div class="col-xs-12">
                      <div class="box">
                          <div class="box-header">
                              <h3 class="box-title">Hover Data Table</h3>
                          </div>
                          <div class="box-body">
                              <table id="example2" class="table table-bordered table-hover">
                                  <thead>
                                  <tr>
                                      <th>服务名</th>
                                      <th>分组</th>
                                      <th>集群数目</th>
                                      <th>实例数</th>
                                      <th>健康实例数</th>
                                      <th>操作</th>
                                  </tr>
                                  </thead>
                                  <tbody>
                                      <#if apps?has_content>
                                        <#list apps as app>
                                          <tr>
                                              <td><b>${app.name}</b></td>
                                              <td>
                                              <#list app.amiCounts as amiCount>
                                                  <b>${amiCount.key}</b> (${amiCount.value})<#if amiCount_has_next>,</#if>
                                              </#list>
                                              </td>
                                              <td>
                                              <#list app.zoneCounts as zoneCount>
                                                  <b>${zoneCount.key}</b> (${zoneCount.value})<#if zoneCount_has_next>,</#if>
                                              </#list>
                                              </td>
                                              <td>
                                              <#list app.instanceInfos as instanceInfo>
                                                <#if instanceInfo.isNotUp>
                                                  <font color=red size=+1><b>
                                                </#if>
                                                  <b>${instanceInfo.status}</b> (${instanceInfo.instances?size}) -
                                                <#if instanceInfo.isNotUp>
                                                  </b></font>
                                                </#if>
                                                <#list instanceInfo.instances as instance>
                                                    <#if instance.isHref>
                                                    <a href="${instance.url}" target="_blank">${instance.id}</a>
                                                    <#else>
                                                        ${instance.id}
                                                    </#if><#if instance_has_next>,</#if>
                                                </#list>
                                              </#list>
                                              </td>
                                              <td>
                                                  <div class="btn-group">
                                                      <button type="button" class="btn btn-default">pause</button>
                                                      <button type="button" class="btn btn-default">resume</button>
                                                      <button type="button" class="btn btn-default">shutdown</button>
                                                  </div>
                                              </td>
                                          </tr>
                                        </#list>
                                      <#else>
                                        <tr><td colspan="4">No instances available</td></tr>
                                      </#if>

                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
              </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">Responsive Hover Table</h3>

                                <div class="box-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tr>
                                        <th>ID</th>
                                        <th>User</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Reason</th>
                                    </tr>
                                    <tr>
                                        <td>183</td>
                                        <td>John Doe</td>
                                        <td>11-7-2014</td>
                                        <td><span class="label label-success">Approved</span></td>
                                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    </tr>
                                    <tr>
                                        <td>219</td>
                                        <td>Alexander Pierce</td>
                                        <td>11-7-2014</td>
                                        <td><span class="label label-warning">Pending</span></td>
                                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    </tr>
                                    <tr>
                                        <td>657</td>
                                        <td>Bob Doe</td>
                                        <td>11-7-2014</td>
                                        <td><span class="label label-primary">Approved</span></td>
                                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    </tr>
                                    <tr>
                                        <td>175</td>
                                        <td>Mike Doe</td>
                                        <td>11-7-2014</td>
                                        <td><span class="label label-danger">Denied</span></td>
                                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    </tr>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
            </section>
		</div>
		<@footer/>
		<@setting/>
        <div class="control-sidebar-bg" style="position: fixed; height: auto;"></div>
	</div>
	<@js/>
</body>
</html>
