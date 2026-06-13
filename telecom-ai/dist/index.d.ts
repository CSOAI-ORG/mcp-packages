export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_network_ai(params: { system_id: string; domain: string }): Promise<McpResult>;
  export function audit_customer_ai(params: { system_id: string; concern: string }): Promise<McpResult>;
  export function evaluate_compliance(params: { regulation: string; system_scope: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
