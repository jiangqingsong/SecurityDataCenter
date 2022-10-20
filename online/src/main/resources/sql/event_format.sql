CREATE TABLE IF NOT EXISTS sdc.event_format(
    `id` varchar(64) COMMENT 'UUID',
    `accept_time` varchar(64) COMMENT '接收时间',
    `evt_time` datetime COMMENT '事件时间',
    `evt_id` varchar(64) COMMENT '事件ID',
    `evt_name` varchar(64) COMMENT '事件名称',
    `evt_type` varchar(64) COMMENT '事件类型',
    `evt_subtype` varchar(64) COMMENT '事件子类型',
    `evt_level` varchar(4) COMMENT '事件等级',
    `evt_description` varchar(255) COMMENT '事件描述',
    `attack_type` varchar(64) COMMENT '攻击类型',
    `attack_brief` varchar(255) COMMENT '攻击摘要',
    `starttime` datetime COMMENT '攻击开始时间',
    `endtime` datetime COMMENT '攻击结束时间',
    `duration` varchar(32) COMMENT '攻击持续时间',
    `protocol` varchar(10) COMMENT '协议名称',
    `dev_type` varchar(32) COMMENT '设备类型',
    `dev_name` varchar(32) COMMENT '设备名称',
    `dev_ip` varchar(32) COMMENT '设备IP',
    `dev_vendor` varchar(32) COMMENT '设备供应商',
    `app_name` varchar(32) COMMENT 'APP名称',
    `app_version` varchar(32) COMMENT 'APP版本',
    `os` varchar(32) COMMENT 'OS',
    `os_version` varchar(32) COMMENT 'OS型号',
    `src_ip` varchar(32) COMMENT '源IP',
    `src_port` varchar(8) COMMENT '源端口',
    `src_ip_type` varchar(32) COMMENT '源IP类型',
    `dest_ip` varchar(32) COMMENT '目的IP',
    `dest_port` varchar(8) COMMENT '目的端口',
    `dest_ip_type` varchar(32) COMMENT '目的端口类型',
    `src_mac` varchar(64) COMMENT '源MAC地址',
    `dest_mac` varchar(64) COMMENT '目的MAC地址',
    `user` varchar(32) COMMENT '用户名',
    `login_method` varchar(32) COMMENT '登陆方式',
    `result` varchar(32) COMMENT '结果',
    `errorcode` varchar(10) COMMENT '错误代码',
    `process` varchar(32) COMMENT '处理',
    `src_ip_country` varchar(32) COMMENT '源IP国家',
    `src_ip_province` varchar(32) COMMENT '源IP省份',
    `src_ip_city` varchar(32) COMMENT '源IP城市',
    `src_ip_county` varchar(32) COMMENT '源IP县城',
    `src_ip_isp` varchar(32) COMMENT '源IP运营商',
    `src_ip_longitude` varchar(32) COMMENT '源IP经度',
    `src_ip_latitude` varchar(32) COMMENT '源IP维度',
    `dest_ip_country` varchar(32) COMMENT '目的IP国家',
    `dest_ip_province` varchar(32) COMMENT '目的IP省份',
    `dest_ip_city` varchar(32) COMMENT '目的IP城市',
    `dest_ip_county` varchar(32) COMMENT '目的IP县城',
    `dest_ip_isp` varchar(32) COMMENT '目的IP运营商',
    `dest_ip_longitude` varchar(32) COMMENT '目的IP经度',
    `dest_ip_latitude` varchar(32) COMMENT '目的IP维度',
    `ul_octets` varchar(32) COMMENT '上行流量字节数',
    `ul_packets` varchar(32) COMMENT '上行流量包数',
    `dl_octets` varchar(32) COMMENT '下行流量字节数',
    `dl_packets` varchar(32) COMMENT '下行流量包数',
    `sum_times` varchar(32) COMMENT '攻击总次数',
    `log_type` varchar(64) COMMENT '日志类型',
    `original_id` varchar(64) COMMENT '原始日志ID'
)
PARTITION BY RANGE(evt_time)()
DISTRIBUTED BY HASH(id) BUCKETS 8
properties(
  "dynamic_partition.enable" = "true",
  "dynamic_partition.time_unit" = "DAY",
  "dynamic_partition.create_history_partition" = "true",
  "dynamic_partition.start" = "-180",
  "dynamic_partition.end" = "1",
  "dynamic_partition.prefix" = "p",
  "dynamic_partition.buckets" = "8"
);
