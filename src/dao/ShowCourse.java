package dao;

import java.util.ArrayList;

import myBean.StuTeaCourseBean;

public class ShowCourse {
	public static String show(ArrayList<StuTeaCourseBean> myCourse, 
			int week, int lesson, String type){
		String str="";
		for(int i = 0;i < myCourse.size();i++)
		{
			StuTeaCourseBean stcb = (StuTeaCourseBean) myCourse.get(i);
			if(stcb.getWeek() != week)
				continue;
			else if(lesson < stcb.getStartlesson() || lesson > stcb.getEndlesson())
				continue;
			else{
				if("cname".equals(type))
				{
					str = stcb.getCname();
					break;
				} else if("tname".equals(type))
				{
					str = stcb.getTname();
					break;
				} else if("property".equals(type))
				{
					str = stcb.getProperty();
					break;
				} else {
					str = stcb.getLocation();
					break;
				}
			}
				
		}
		return str;
	}
}
