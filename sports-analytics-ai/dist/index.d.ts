export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_analytics(params: { system_id: string; sport: string }): Promise<McpResult>;
  export function audit_predictions(params: { model_id: string; bias_type: string }): Promise<McpResult>;
  export function evaluate_compliance(params: { league: string; usage: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
