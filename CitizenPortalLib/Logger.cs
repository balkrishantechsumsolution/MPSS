using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace CitizenPortalLib
{
    public class Logger
    {
        public static TraceSwitch CommonTraceSwitch = new TraceSwitch("ServicesTraceSwitch", "Tracing in Services Web Application");

        public static void LogError( string Message)
        {
            System.Diagnostics.Trace.WriteLineIf( CommonTraceSwitch.TraceError, FormatLogMessage(Message));
        }

        public static void LogWarning(string Message)
        {
            System.Diagnostics.Trace.WriteLineIf(CommonTraceSwitch.TraceWarning, FormatLogMessage(Message));
        }


        public static void LogInformation(string Message)
        {
            System.Diagnostics.Trace.WriteLineIf(CommonTraceSwitch.TraceInfo, FormatLogMessage(Message));
        }


        public static void LogVerbose(string Message)
        {
            System.Diagnostics.Trace.WriteLineIf(CommonTraceSwitch.TraceVerbose, FormatLogMessage(Message));
        }

        public static string FormatLogMessage(string Message)
        {
            return DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss") + "  --  " + Message;
        
        }

        public static void LogException(string Message , Exception ExceptionToLog)
        {

            LogError(FormatException(Message, ExceptionToLog));

        }

        public static string FormatException(string Message, Exception ExceptionToLog)
        {

            return DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss") + "  --  " + Message + " -- \n" + ExceptionToLog.Message + " -- \n" + ExceptionToLog.StackTrace;

        }




    }
}
