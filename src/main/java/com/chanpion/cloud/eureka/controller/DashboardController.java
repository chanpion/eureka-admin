package com.chanpion.cloud.eureka.controller;

import com.netflix.appinfo.AmazonInfo;
import com.netflix.appinfo.ApplicationInfoManager;
import com.netflix.appinfo.DataCenterInfo;
import com.netflix.appinfo.InstanceInfo;
import com.netflix.config.ConfigurationManager;
import com.netflix.eureka.EurekaServerContext;
import com.netflix.eureka.EurekaServerContextHolder;
import com.netflix.eureka.cluster.PeerEurekaNode;
import com.netflix.eureka.registry.PeerAwareInstanceRegistry;
import com.netflix.eureka.resources.StatusResource;
import com.netflix.eureka.util.StatusInfo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.URI;
import java.util.*;

/**
 * @author April Chen
 * @date 2019/8/22 19:49
 */
@Controller
public class DashboardController {
    private String dashboardPath = "/";

    @Resource
    private ApplicationInfoManager applicationInfoManager;

    @GetMapping("/index")
    public String index(HttpServletRequest request, Map<String, Object> model) {
        StatusInfo statusInfo;
        try {
            statusInfo = new StatusResource().getStatusInfo();
        } catch (Exception e) {
            statusInfo = StatusInfo.Builder.newBuilder().isHealthy(false).build();
        }
        model.put("statusInfo", statusInfo);
        populateBase(request, model);
        populateInstanceInfo(model, statusInfo);
        return "index";
    }

    private void populateBase(HttpServletRequest request, Map<String, Object> model) {
        model.put("time", new Date());
        model.put("basePath", "/");
        model.put("dashboardPath", "/".equals(this.dashboardPath) ? "" : this.dashboardPath);
        populateHeader(model);
        populateNavbar(request, model);
    }

    private void populateHeader(Map<String, Object> model) {
        model.put("currentTime", StatusResource.getCurrentTimeAsString());
        model.put("upTime", StatusInfo.getUpTime());
        model.put("environment", ConfigurationManager.getDeploymentContext().getDeploymentEnvironment());
        model.put("datacenter", ConfigurationManager.getDeploymentContext().getDeploymentDatacenter());
        PeerAwareInstanceRegistry registry = getRegistry();
        model.put("registry", registry);
        model.put("isBelowRenewThresold", registry.isBelowRenewThresold() == 1);
        DataCenterInfo info = applicationInfoManager.getInfo().getDataCenterInfo();
        if (info.getName() == DataCenterInfo.Name.Amazon) {
            AmazonInfo amazonInfo = (AmazonInfo) info;
            model.put("amazonInfo", amazonInfo);
            model.put("amiId", amazonInfo.get(AmazonInfo.MetaDataKey.amiId));
            model.put("availabilityZone", amazonInfo.get(AmazonInfo.MetaDataKey.availabilityZone));
            model.put("instanceId", amazonInfo.get(AmazonInfo.MetaDataKey.instanceId));
        }
    }

    private void populateNavbar(HttpServletRequest request, Map<String, Object> model) {
        Map<String, String> replicas = new LinkedHashMap<>();
        List<PeerEurekaNode> list = getServerContext().getPeerEurekaNodes().getPeerNodesView();
        for (PeerEurekaNode node : list) {
            try {
                URI uri = new URI(node.getServiceUrl());
                String href = scrubBasicAuth(node.getServiceUrl());
                replicas.put(uri.getHost(), href);
            } catch (Exception ex) {
                // ignore?
            }
        }
        model.put("replicas", replicas.entrySet());
    }

    private void populateInstanceInfo(Map<String, Object> model, StatusInfo statusInfo) {
        InstanceInfo instanceInfo = statusInfo.getInstanceInfo();
        Map<String, String> instanceMap = new HashMap<>();
        instanceMap.put("ipAddr", instanceInfo.getIPAddr());
        instanceMap.put("status", instanceInfo.getStatus().toString());
        if (instanceInfo.getDataCenterInfo().getName() == DataCenterInfo.Name.Amazon) {
            AmazonInfo info = (AmazonInfo) instanceInfo.getDataCenterInfo();
            instanceMap.put("availability-zone",
                    info.get(AmazonInfo.MetaDataKey.availabilityZone));
            instanceMap.put("public-ipv4", info.get(AmazonInfo.MetaDataKey.publicIpv4));
            instanceMap.put("instance-id", info.get(AmazonInfo.MetaDataKey.instanceId));
            instanceMap.put("public-hostname",
                    info.get(AmazonInfo.MetaDataKey.publicHostname));
            instanceMap.put("ami-id", info.get(AmazonInfo.MetaDataKey.amiId));
            instanceMap.put("instance-type",
                    info.get(AmazonInfo.MetaDataKey.instanceType));
        }
        model.put("instanceInfo", instanceMap);
    }

    private PeerAwareInstanceRegistry getRegistry() {
        return getServerContext().getRegistry();
    }

    private EurekaServerContext getServerContext() {
        return EurekaServerContextHolder.getInstance().getServerContext();
    }

    private String scrubBasicAuth(String urlList) {
        String[] urls = urlList.split(",");
        StringBuilder filteredUrls = new StringBuilder();
        for (String u : urls) {
            if (u.contains("@")) {
                filteredUrls.append(u.substring(0, u.indexOf("//") + 2))
                        .append(u.substring(u.indexOf("@") + 1, u.length())).append(",");
            } else {
                filteredUrls.append(u).append(",");
            }
        }
        return filteredUrls.substring(0, filteredUrls.length() - 1);
    }
}
