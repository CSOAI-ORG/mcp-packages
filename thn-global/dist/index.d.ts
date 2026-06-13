export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_humanitarian_ai(params: { system_id: string; domain: string }): Promise<McpResult>;
  export function evaluate_equity(params: { program_id: string; metric: string }): Promise<McpResult>;
  export function audit_data_practices(params: { system_id: string; concern: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; standard: string }): Promise<McpResult>;
};
