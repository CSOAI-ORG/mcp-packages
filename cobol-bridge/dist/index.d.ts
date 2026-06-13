export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function analyze_cobol(params: { program_name: string; analysis_type: string }): Promise<McpResult>;
  export function bridge_audit(params: { bridge_id: string; check_type: string }): Promise<McpResult>;
  export function monitor_mainframe(params: { system_id: string; metric: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
