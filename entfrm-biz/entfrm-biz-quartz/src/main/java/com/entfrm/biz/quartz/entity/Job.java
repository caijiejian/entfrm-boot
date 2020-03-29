package com.entfrm.biz.quartz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.entfrm.core.data.entity.BaseEntity;
import lombok.*;

import java.util.Date;

/**
 * 定时任务调度表
 *
 * @author yong
 * @date 2019-06-28
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("sys_job")
public class Job extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/**
	 * 任务id
	 */
	@TableId
	private Integer id;
	/**
	 * 任务名称
	 */
	private String jobName;
	/**
	 * 任务组名
	 */
	private String jobGroup;
	/**
	 * 组内执行顺利，值越大执行优先级越高，最大值9，最小值1
	 */
	private String jobOrder;
	/**
	 * 1、java类;2、spring bean名称;3、rest调用;4、jar调用;9其他
	 */
	private String jobType;
	/**
	 * ob_type=1时，类完整路径;job_type=2时，spring bean名称;其它值为空
	 * job_type=3时，rest调用地址，仅支持rest get协议,需要增加String返回值，0成功，1失败;job_type=4时，jar路径;其它值为空
	 */
	private String executePath;
	/**
	 * 参数值
	 */
    private String paramsValue;
	/**
	 * cron执行表达式
	 */
	private String cronExpression;
	/**
	 * 错失执行策略（1错失周期立即执行 2错失周期执行一次 3下周期执行）
	 */
	private String misfirePolicy;
	/**
	 * 1、多租户任务;2、非多租户任务
	 */
	private String jobTenantType;
	/**
	 * 状态（0、未发布;1、已发布;2、运行中;3、暂停;4、删除;）
	 */
	private String jobStatus;
	/**
	 * 状态（0正常 1异常）
	 */
	private String jobExecuteStatus;

	/**
	 * 首次执行时间
	 */
	private Date startTime;
	/**
	 * 上次执行时间
	 */
	private Date previousTime;
	/**
	 * 下次执行时间
	 */
	private Date nextTime;

}
