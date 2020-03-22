package com.entfrm.core.base.constant;

/**
 * @author yong
 * @date 2020/3/13
 * @description sql脚本
 */
public interface SqlConstants {

    String QUERY_USER = "select id, user_name userName, nick_name nickName, password, dept_id deptId, status from sys_user where user_name = ?";

    String QUERY_ROLES = "select role_id roleId from sys_user_role where user_id = ?";

    String QUERY_PREMS = "select m.perms from sys_menu m left join sys_role_menu rm on rm.menu_id = m.id where rm.role_id = ? and m.type = 'F'";

    String OPER_LOG = "insert into sys_oper_log (type, title, method, user_agent, oper_name, client_id, oper_url, oper_ip, oper_addr, oper_param, status, error_msg, execute_time, oper_time) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    String LOGIN_LOG = "insert into sys_login_log (login_name, login_type, login_ip, login_addr, user_agent, status, msg, login_time) values (?,?,?,?,?,?,?,?)";

    String ROLE_DATASCOPE = "select data_scope dataScope from sys_role where id = ?";
}
