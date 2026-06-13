export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_pricing(params: { system_id: string; check_type: string }): Promise<McpResult>;
  export function audit_recommendations(params: { system_id: string; concern: string }): Promise<McpResult>;
  export function monitor_inventory(params: { system_id: string; metric: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
