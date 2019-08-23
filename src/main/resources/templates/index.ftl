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
                    Dashboard
                </h1>
            </section>

            <!-- Main content -->
            <section class="content" id="content">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3>150</h3>

                                <p>集群数</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="http://adminlte.la998.com/#" class="small-box-footer">更多 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3>53<sup style="font-size: 20px">%</sup></h3>

                                <p>成功率</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="http://adminlte.la998.com/#" class="small-box-footer">更多 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-yellow">
                            <div class="inner">
                                <h3>44</h3>

                                <p>Registrations</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="http://adminlte.la998.com/#" class="small-box-footer">更多 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                            <div class="inner">
                                <h3>65</h3>

                                <p>访客</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="http://adminlte.la998.com/#" class="small-box-footer">更多 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->
                <div class="container-fluid xd-container">
                    <h1>System Status</h1>
                    <div class="row">
                        <div class="col-md-6">
                            <table id='instances' class="table table-condensed table-striped table-hover">
                              <#if amazonInfo??>
                                <tr>
                                    <td>EUREKA SERVER</td>
                                    <td>AMI: ${amiId!}</td>
                                </tr>
                                <tr>
                                    <td>Zone</td>
                                    <td>${availabilityZone!}</td>
                                </tr>
                                <tr>
                                    <td>instance-id</td>
                                    <td>${instanceId!}</td>
                                </tr>
                              </#if>
                                <tr>
                                    <td>Environment</td>
                                    <td>${environment!}</td>
                                </tr>
                                <tr>
                                    <td>Data center</td>
                                    <td>${datacenter!}</td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <table id='instances' class="table table-condensed table-striped table-hover">
                                <tr>
                                    <td>Current time</td>
                                    <td>${currentTime}</td>
                                </tr>
                                <tr>
                                    <td>Uptime</td>
                                    <td>${upTime}</td>
                                </tr>
                                <tr>
                                    <td>Lease expiration enabled</td>
                                    <td>${registry.leaseExpirationEnabled?c}</td>
                                </tr>
                                <tr>
                                    <td>Renews threshold</td>
                                    <td>${registry.numOfRenewsPerMinThreshold}</td>
                                </tr>
                                <tr>
                                    <td>Renews (last min)</td>
                                    <td>${registry.numOfRenewsInLastMin}</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <h1>DS Replicas</h1>
                    <ul class="list-group">
                      <#list replicas as replica>
                          <li class="list-group-item"><a href="${replica.value}">${replica.key}</a></li>
                      </#list>
                    </ul>

                    <h1>General Info</h1>
                    <table id='generalInfo' class="table table-striped table-hover">
                        <thead>
                        <tr><th>Name</th><th>Value</th></tr>
                        </thead>
                        <tbody>
                          <#list statusInfo.generalStats?keys as stat>
                            <tr>
                                <td>${stat}</td><td>${statusInfo.generalStats[stat]!""}</td>
                            </tr>
                          </#list>
                          <#list statusInfo.applicationStats?keys as stat>
                            <tr>
                                <td>${stat}</td><td>${statusInfo.applicationStats[stat]!""}</td>
                            </tr>
                          </#list>
                        </tbody>
                    </table>
                    <h1>Instance Info</h1>

                    <table id='instanceInfo' class="table table-striped table-hover">
                        <thead>
                        <tr><th>Name</th><th>Value</th></tr>
                        <thead>
                        <tbody>
                          <#list instanceInfo?keys as key>
                          <tr>
                              <td>${key}</td><td>${instanceInfo[key]!""}</td>
                          </tr>
                          </#list>
                        </tbody>
                    </table>
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
