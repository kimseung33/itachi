package kr.co.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SampleAdvice {
	@Before("execution(* kr.co.service.MessageService*.*(..))")
	public void startLog() {
		System.out.println("***********");
		System.out.println("시작합니다.");
		System.out.println("***********");
	}
	
	@After("execution(* kr.co.service.MessageService*.*(..))")
	public void endLog() {
		System.out.println("***********");
		System.out.println("끗.");
		System.out.println("***********");
	}
	
	@Around("execution(* kr.co.service.MessageService*.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
		
		long start =System.currentTimeMillis();
		
		Object result=pjp.proceed();
		
		long end =System.currentTimeMillis();
		
		System.out.println(end-start);
		System.out.println("----------------");		
		return result;
	}
}
