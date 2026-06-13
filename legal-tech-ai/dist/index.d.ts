export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_compliance(params: { system_name: string; regulation: string }): Promise<McpResult>;
  export function audit_analysis(params: { model_id: string; practice_area: string }): Promise<McpResult>;
  export function monitor_decisions(params: { system_id: string; metric: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
