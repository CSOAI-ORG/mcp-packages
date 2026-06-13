export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_compliance(params: { system_name: string; regulation: string }): Promise<McpResult>;
  export function audit_predictions(params: { model_id: string; crop_type: string }): Promise<McpResult>;
  export function monitor_precision(params: { farm_id: string; metric: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
