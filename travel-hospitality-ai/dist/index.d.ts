export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_booking_ai(params: { system_id: string; concern: string }): Promise<McpResult>;
  export function audit_pricing(params: { system_id: string; analysis: string }): Promise<McpResult>;
  export function evaluate_personalization(params: { system_id: string; regulation: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
