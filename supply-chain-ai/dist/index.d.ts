export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_forecasting(params: { model_id: string; metric: string }): Promise<McpResult>;
  export function audit_logistics(params: { system_id: string; concern: string }): Promise<McpResult>;
  export function evaluate_supplier_risk(params: { system_id: string; risk_type: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
