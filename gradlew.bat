@echo off
rem ------------------------------------------------------------------------------
rem
rem Gradle start up script for Windows
rem
rem ------------------------------------------------------------------------------

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Determine the Java command to use to start the JVM.
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.
exit /b 1

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%

set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.
exit /b 1

:execute
@rem Add default JVM options to JAVA_OPTS. This can be done here so that it is picked up after the first test (JAVA_OPTS is defined in that test).
if not "%DEFAULT_JVM_OPTS%"=="" set JAVA_OPTS=%JAVA_OPTS% %DEFAULT_JVM_OPTS%

@rem Find the script directory
set APP_HOME=%~dp0

@rem Resolve any symlinks
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options to JAVA_OPTS. This can be done here so that it is picked up after the first test (JAVA_OPTS is defined in that test).
if not "%DEFAULT_JVM_OPTS%"=="" set JAVA_OPTS=%JAVA_OPTS% %DEFAULT_JVM_OPTS%

set CLASSPATH=%APP_HOME%gradle/wrapper/gradle-wrapper.jar

@rem Collect all arguments for the java command, following the shell conventions for quoting and escaping
set ARGS=
:collectArgs
if "%~1"=="" goto executeJava
set ARGS=%ARGS% "%~1"
shift
goto collectArgs

:executeJava
"%JAVA_EXE%" %JAVA_OPTS% %GRADLE_OPTS% -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %ARGS%