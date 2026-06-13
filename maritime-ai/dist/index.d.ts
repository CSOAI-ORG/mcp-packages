export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_compliance(params: { system_name: string; regulation: string }): Promise<McpResult>;
  export function audit_navigation(params: { model_id: string; vessel_type: string }): Promise<McpResult>;
  export function monitor_operations(params: { system_id: string; metric: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
