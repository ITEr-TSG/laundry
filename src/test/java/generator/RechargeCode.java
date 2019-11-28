package generator;

import org.junit.Test;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

public class RechargeCode {
	
	@Test
    public void testGenerateCode() {
		//全局配置
		GlobalConfig globalConfig = new GlobalConfig();
		globalConfig.setActiveRecord(true)	//是否支持AR模式
					.setAuthor("ITEr")		//作者签名
					.setOutputDir("F:\\workspace\\EclipseWork\\graduation\\laundry\\src\\main\\java")
					.setFileOverride(true) 	//文件覆盖
					.setIdType(IdType.AUTO)	//主键策略
					.setServiceName("%sService")//生成的service接口是否带I
					.setBaseResultMap(true) //sql结果映射
					.setBaseColumnList(true)//sql列的映射
		;		
		//数据源配置
		DataSourceConfig dataSourceConfig = new DataSourceConfig();
		dataSourceConfig.setDbType(DbType.MYSQL)
						.setDriverName("com.mysql.jdbc.Driver")
						.setUrl("jdbc:mysql://localhost:3306/laundry-hp?useUnicode=true&amp;characterEncoding=utf8&amp;useSSL=true")
						.setUsername("root")
						.setPassword("123456");
		
		//策略配置
		StrategyConfig strategyConfig = new StrategyConfig();
		strategyConfig.setCapitalMode(true)//全局大写命名
					  .setDbColumnUnderline(true)//指定表明 字段名是否使用下划线
					  .setNaming(NamingStrategy.underline_to_camel)//下划线转驼峰命名
					  .setTablePrefix("tb_")
					  .setInclude("tb_recharge_cust");//具体的表
		//包名策略配置
		PackageConfig packageConfig = new PackageConfig();
		packageConfig.setParent("com.hp.integral")
					 .setController("controller")
					 .setEntity("beans")
					 .setMapper("mapper")
					 .setService("service");
					 
		//整合配置
		AutoGenerator autoGenerator = new AutoGenerator();
		autoGenerator.setGlobalConfig(globalConfig)
					 .setDataSource(dataSourceConfig)
					 .setPackageInfo(packageConfig)
					 .setStrategy(strategyConfig);
		//执行
		autoGenerator.execute();
		
    }

    
}
